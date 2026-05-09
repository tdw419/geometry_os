; DESCRIPTION: Renders a black box of size 85x64 starting at (146, 147).
; PLAN: r0=146(x), r1=147(y), r2=85(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 147
LDI r2, 85
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
