; DESCRIPTION: Places a cyan 90x27 rectangle at position (73, 117).
; PLAN: r0=73(x), r1=117(y), r2=90(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 117
LDI r2, 90
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
