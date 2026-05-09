; DESCRIPTION: Places a cyan 55x109 rectangle at position (331, 59).
; PLAN: r0=331(x), r1=59(y), r2=55(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 59
LDI r2, 55
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
