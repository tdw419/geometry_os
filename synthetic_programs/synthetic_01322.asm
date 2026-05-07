; counted animation
; initialization
  LDI r22, 1110
  LDI r0, 16
  LDI r2, 40
loop_0:
  LDI r9, 0x07A5BC
  LDI r17, 10
  LDI r15, 0x6E46AC
  WPIXEL
  SHR r10, r4, r0
  LDI r0, 1
  SUB r2, r2, r0
  JNZ r2, loop_0
  HALT
