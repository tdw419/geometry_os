; DESCRIPTION: Places a green 38x86 rectangle at position (174, 121).
; PLAN: r0=174(x), r1=121(y), r2=38(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 121
LDI r2, 38
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
