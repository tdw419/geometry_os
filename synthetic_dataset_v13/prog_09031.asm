; DESCRIPTION: Renders a cyan box of size 25x116 starting at (85, 108).
; PLAN: r0=85(x), r1=108(y), r2=25(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 108
LDI r2, 25
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
