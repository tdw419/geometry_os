; DESCRIPTION: Places a yellow 72x97 rectangle at position (284, 154).
; PLAN: r0=284(x), r1=154(y), r2=72(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 154
LDI r2, 72
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
