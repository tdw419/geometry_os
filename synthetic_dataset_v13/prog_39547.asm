; DESCRIPTION: Places a yellow 66x113 rectangle at position (21, 13).
; PLAN: r0=21(x), r1=13(y), r2=66(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 13
LDI r2, 66
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
