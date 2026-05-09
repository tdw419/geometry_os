; DESCRIPTION: Places a yellow 47x22 rectangle at position (401, 45).
; PLAN: r0=401(x), r1=45(y), r2=47(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 45
LDI r2, 47
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
