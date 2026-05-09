; DESCRIPTION: Renders a cyan box of size 44x52 starting at (125, 30).
; PLAN: r0=125(x), r1=30(y), r2=44(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 30
LDI r2, 44
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
