; DESCRIPTION: Places a cyan 97x19 rectangle at position (59, 236).
; PLAN: r0=59(x), r1=236(y), r2=97(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 236
LDI r2, 97
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
