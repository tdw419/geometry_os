; DESCRIPTION: Places a red 35x91 rectangle at position (65, 154).
; PLAN: r0=65(x), r1=154(y), r2=35(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 154
LDI r2, 35
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
