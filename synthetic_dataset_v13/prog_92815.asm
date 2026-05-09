; DESCRIPTION: Places a cyan 80x116 rectangle at position (144, 95).
; PLAN: r0=144(x), r1=95(y), r2=80(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 95
LDI r2, 80
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
