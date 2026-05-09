; DESCRIPTION: Renders a cyan box of size 12x60 starting at (125, 40).
; PLAN: r0=125(x), r1=40(y), r2=12(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 40
LDI r2, 12
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
