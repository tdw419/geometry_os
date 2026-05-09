; DESCRIPTION: Places a red 34x86 rectangle at position (305, 140).
; PLAN: r0=305(x), r1=140(y), r2=34(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 140
LDI r2, 34
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
