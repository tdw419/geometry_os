; DESCRIPTION: Places a yellow 38x120 rectangle at position (108, 125).
; PLAN: r0=108(x), r1=125(y), r2=38(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 125
LDI r2, 38
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
