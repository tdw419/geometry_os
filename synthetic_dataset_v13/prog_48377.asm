; DESCRIPTION: Places a yellow 113x99 rectangle at position (27, 16).
; PLAN: r0=27(x), r1=16(y), r2=113(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 16
LDI r2, 113
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
