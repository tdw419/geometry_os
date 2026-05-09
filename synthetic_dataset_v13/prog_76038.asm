; DESCRIPTION: Places a cyan 55x75 rectangle at position (272, 8).
; PLAN: r0=272(x), r1=8(y), r2=55(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 8
LDI r2, 55
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
