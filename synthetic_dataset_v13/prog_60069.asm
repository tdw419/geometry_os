; DESCRIPTION: Places a cyan 93x46 rectangle at position (315, 206).
; PLAN: r0=315(x), r1=206(y), r2=93(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 206
LDI r2, 93
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
