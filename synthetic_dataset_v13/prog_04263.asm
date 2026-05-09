; DESCRIPTION: Places a yellow 20x59 rectangle at position (242, 154).
; PLAN: r0=242(x), r1=154(y), r2=20(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 154
LDI r2, 20
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
