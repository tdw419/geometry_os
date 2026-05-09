; DESCRIPTION: Renders a cyan box of size 94x116 starting at (122, 36).
; PLAN: r0=122(x), r1=36(y), r2=94(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 36
LDI r2, 94
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
