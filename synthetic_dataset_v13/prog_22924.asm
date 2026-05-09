; DESCRIPTION: Places a cyan 17x44 rectangle at position (495, 47).
; PLAN: r0=495(x), r1=47(y), r2=17(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 47
LDI r2, 17
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
