; DESCRIPTION: Places a cyan 33x25 rectangle at position (272, 108).
; PLAN: r0=272(x), r1=108(y), r2=33(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 108
LDI r2, 33
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
