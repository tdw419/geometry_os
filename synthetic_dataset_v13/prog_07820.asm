; DESCRIPTION: Places a cyan 33x75 rectangle at position (433, 136).
; PLAN: r0=433(x), r1=136(y), r2=33(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 136
LDI r2, 33
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
