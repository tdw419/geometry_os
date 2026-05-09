; DESCRIPTION: Places a green 27x31 rectangle at position (315, 213).
; PLAN: r0=315(x), r1=213(y), r2=27(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 213
LDI r2, 27
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
