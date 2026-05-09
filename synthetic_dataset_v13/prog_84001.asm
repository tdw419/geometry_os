; DESCRIPTION: Places a cyan 33x116 rectangle at position (102, 22).
; PLAN: r0=102(x), r1=22(y), r2=33(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 22
LDI r2, 33
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
