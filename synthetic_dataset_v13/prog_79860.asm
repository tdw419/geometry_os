; DESCRIPTION: Renders a cyan box of size 90x33 starting at (16, 116).
; PLAN: r0=16(x), r1=116(y), r2=90(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 116
LDI r2, 90
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
