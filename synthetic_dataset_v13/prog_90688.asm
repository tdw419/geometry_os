; DESCRIPTION: Places a red 42x22 rectangle at position (221, 46).
; PLAN: r0=221(x), r1=46(y), r2=42(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 46
LDI r2, 42
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
