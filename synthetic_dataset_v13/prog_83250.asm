; DESCRIPTION: Places a cyan 46x22 rectangle at position (301, 213).
; PLAN: r0=301(x), r1=213(y), r2=46(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 213
LDI r2, 46
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
