; DESCRIPTION: Renders a cyan box of size 15x115 starting at (235, 109).
; PLAN: r0=235(x), r1=109(y), r2=15(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 109
LDI r2, 15
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
