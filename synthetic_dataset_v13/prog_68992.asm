; DESCRIPTION: Places a cyan 90x22 rectangle at position (385, 202).
; PLAN: r0=385(x), r1=202(y), r2=90(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 202
LDI r2, 90
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
