; DESCRIPTION: Places a cyan 22x90 rectangle at position (175, 127).
; PLAN: r0=175(x), r1=127(y), r2=22(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 127
LDI r2, 22
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
