; DESCRIPTION: Renders a green box of size 25x12 starting at (173, 161).
; PLAN: r0=173(x), r1=161(y), r2=25(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 161
LDI r2, 25
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
