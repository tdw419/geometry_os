; DESCRIPTION: Places a yellow 48x10 rectangle at position (266, 236).
; PLAN: r0=266(x), r1=236(y), r2=48(width), r3=10(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 236
LDI r2, 48
LDI r3, 10
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
