; DESCRIPTION: Places a green 33x14 rectangle at position (370, 174).
; PLAN: r0=370(x), r1=174(y), r2=33(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 174
LDI r2, 33
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
