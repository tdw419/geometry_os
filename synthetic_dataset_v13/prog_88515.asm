; DESCRIPTION: Places a purple 48x31 rectangle at position (439, 135).
; PLAN: r0=439(x), r1=135(y), r2=48(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 135
LDI r2, 48
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
