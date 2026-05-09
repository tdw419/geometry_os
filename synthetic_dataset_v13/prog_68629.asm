; DESCRIPTION: Places a cyan 54x39 rectangle at position (177, 87).
; PLAN: r0=177(x), r1=87(y), r2=54(width), r3=39(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 87
LDI r2, 54
LDI r3, 39
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
