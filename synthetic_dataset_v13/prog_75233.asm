; DESCRIPTION: Renders a cyan box of size 113x60 starting at (5, 84).
; PLAN: r0=5(x), r1=84(y), r2=113(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 84
LDI r2, 113
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
