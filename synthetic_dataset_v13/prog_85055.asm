; DESCRIPTION: Places a yellow 31x46 rectangle at position (42, 143).
; PLAN: r0=42(x), r1=143(y), r2=31(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 143
LDI r2, 31
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
