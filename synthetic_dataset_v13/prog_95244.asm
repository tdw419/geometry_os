; DESCRIPTION: Renders a cyan box of size 40x103 starting at (445, 147).
; PLAN: r0=445(x), r1=147(y), r2=40(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 147
LDI r2, 40
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
