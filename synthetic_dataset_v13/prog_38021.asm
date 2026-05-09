; DESCRIPTION: Places a cyan 39x97 rectangle at position (413, 79).
; PLAN: r0=413(x), r1=79(y), r2=39(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 79
LDI r2, 39
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
