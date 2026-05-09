; DESCRIPTION: Places a cyan 96x46 rectangle at position (350, 194).
; PLAN: r0=350(x), r1=194(y), r2=96(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 194
LDI r2, 96
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
