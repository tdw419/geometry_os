; DESCRIPTION: Places a cyan 120x106 rectangle at position (301, 136).
; PLAN: r0=301(x), r1=136(y), r2=120(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 136
LDI r2, 120
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
