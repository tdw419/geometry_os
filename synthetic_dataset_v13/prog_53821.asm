; DESCRIPTION: Renders a cyan box of size 71x29 starting at (254, 192).
; PLAN: r0=254(x), r1=192(y), r2=71(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 192
LDI r2, 71
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
