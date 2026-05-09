; DESCRIPTION: Renders a cyan box of size 82x61 starting at (40, 147).
; PLAN: r0=40(x), r1=147(y), r2=82(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 147
LDI r2, 82
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
