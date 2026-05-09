; DESCRIPTION: Places a cyan 21x116 rectangle at position (202, 1).
; PLAN: r0=202(x), r1=1(y), r2=21(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 1
LDI r2, 21
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
