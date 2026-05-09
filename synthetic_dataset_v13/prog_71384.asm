; DESCRIPTION: Places a cyan 100x25 rectangle at position (213, 143).
; PLAN: r0=213(x), r1=143(y), r2=100(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 143
LDI r2, 100
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
