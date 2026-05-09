; DESCRIPTION: Places a yellow 41x21 rectangle at position (470, 117).
; PLAN: r0=470(x), r1=117(y), r2=41(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 117
LDI r2, 41
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
