; DESCRIPTION: Places a black 111x65 rectangle at position (259, 187).
; PLAN: r0=259(x), r1=187(y), r2=111(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 187
LDI r2, 111
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
