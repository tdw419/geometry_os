; DESCRIPTION: Places a cyan 44x82 rectangle at position (175, 96).
; PLAN: r0=175(x), r1=96(y), r2=44(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 96
LDI r2, 44
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
