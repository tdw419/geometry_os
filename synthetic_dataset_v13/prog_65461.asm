; DESCRIPTION: Places a orange 37x64 rectangle at position (154, 169).
; PLAN: r0=154(x), r1=169(y), r2=37(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 169
LDI r2, 37
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
