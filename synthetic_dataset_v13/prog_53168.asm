; DESCRIPTION: Renders a cyan box of size 33x116 starting at (236, 40).
; PLAN: r0=236(x), r1=40(y), r2=33(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 40
LDI r2, 33
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
