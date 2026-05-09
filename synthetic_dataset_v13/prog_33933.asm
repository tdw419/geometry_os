; DESCRIPTION: Places a cyan 106x60 rectangle at position (301, 160).
; PLAN: r0=301(x), r1=160(y), r2=106(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 160
LDI r2, 106
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
