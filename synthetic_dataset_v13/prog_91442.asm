; DESCRIPTION: Places a black 44x16 rectangle at position (352, 208).
; PLAN: r0=352(x), r1=208(y), r2=44(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 208
LDI r2, 44
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
