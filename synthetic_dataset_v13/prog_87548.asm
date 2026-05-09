; DESCRIPTION: Renders a cyan box of size 59x15 starting at (328, 235).
; PLAN: r0=328(x), r1=235(y), r2=59(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 235
LDI r2, 59
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
