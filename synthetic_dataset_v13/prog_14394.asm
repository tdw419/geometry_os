; DESCRIPTION: Renders a green box of size 107x64 starting at (254, 186).
; PLAN: r0=254(x), r1=186(y), r2=107(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 186
LDI r2, 107
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
