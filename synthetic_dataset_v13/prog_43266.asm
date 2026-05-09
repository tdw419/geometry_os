; DESCRIPTION: Places a yellow 70x47 rectangle at position (245, 72).
; PLAN: r0=245(x), r1=72(y), r2=70(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 72
LDI r2, 70
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
