; DESCRIPTION: Composite: Places a green dot at position (404, 244) then Places a red 84x70 rectangle at position (131, 76).
; PLAN: r0=404(x), r1=244(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=131(x), r6=76(y), r7=84(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 244
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 131
LDI r6, 76
LDI r7, 84
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
